package com.corbado.api;

import android.app.Activity;
import android.app.Application;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.pm.PackageManager;
import android.content.pm.verify.domain.DomainVerificationManager;
import android.content.pm.verify.domain.DomainVerificationUserState;
import android.util.Base64;
import android.util.Log;

import androidx.annotation.NonNull;

import com.google.android.gms.auth.api.credentials.CredentialRequestResponse;
import com.google.android.gms.common.api.GoogleApi;
import com.google.android.gms.fido.Fido;
import com.google.android.gms.fido.fido2.Fido2ApiClient;
import com.google.android.gms.fido.fido2.api.common.AuthenticatorAttestationResponse;
import com.google.android.gms.fido.fido2.api.common.AuthenticatorErrorResponse;
import com.google.android.gms.fido.fido2.api.common.AuthenticatorResponse;
import com.google.android.gms.fido.fido2.api.common.PublicKeyCredential;
import com.google.android.gms.fido.fido2.api.common.PublicKeyCredentialCreationOptions;
import com.google.android.gms.fido.fido2.api.common.PublicKeyCredentialUserEntity;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kotlin.text.Charsets;


public class Authenticator {
    private static final int REGISTER_REQUEST_CODE = 28739428;
    private static final int SIGN_REQUEST_CODE = 446712374;

    public void onActivityResult(int requestCode, int resultCode, Intent data){
        if(requestCode == REGISTER_REQUEST_CODE) {
            Log.d("[Authenticator]", "onActivityResult called requestCode: "
                    + requestCode + ", resultCode: " + resultCode);
            Log.d("[Authenticator]", "getAction: " + data.getAction());
            Log.d("[Authenticator]", "getDataString: " + data.getDataString());
            if (requestCode == REGISTER_REQUEST_CODE) {
                byte[] fido2Response = data.getByteArrayExtra(Fido.FIDO2_KEY_RESPONSE_EXTRA);
                byte[] fido2Response2 = data.getByteArrayExtra(Fido.FIDO2_KEY_CREDENTIAL_EXTRA);
                if(data.getSerializableExtra(Fido.KEY_RESPONSE_EXTRA) != null)
                    System.out.println("getSerializableExtra not null");
                if(data.getParcelableExtra(Fido.KEY_RESPONSE_EXTRA) != null)
                    System.out.println("getParcelableExtra not null");

                if(data.getSerializableExtra(Fido.KEY_RESPONSE_EXTRA) != null)
                    System.out.println("getSerializableExtra not null");
                if(data.getSerializableExtra(Fido.KEY_RESPONSE_EXTRA) != null)
                    System.out.println("getSerializableExtra not null");
                if(fido2Response != null)
                    Log.d("[Authenticator]", "fido2Response length: " + fido2Response.length);
                else
                    Log.d("[Authenticator]", "fido2Response is null ");

                if(fido2Response2 != null) {
                    Log.d("[Authenticator]", "fido2Response2 length: " + fido2Response2.length);
                    PublicKeyCredential credential = PublicKeyCredential.deserializeFromBytes(fido2Response2);
                    Log.d("[Authenticator]", "credential.getId() " + credential.getId());
                    Log.d("[Authenticator]", "credential.getRawId() " + credential.getRawId());
                    Log.d("[Authenticator]", "credential.getClientExtensionResults() " + credential.getClientExtensionResults());
                    AuthenticatorResponse resp = credential.getResponse();
                    if(resp.getClass() == AuthenticatorErrorResponse.class){
                        Log.d("[Authenticator]", "AuthenticatorErrorResponse");
                        AuthenticatorErrorResponse errorResponse = (AuthenticatorErrorResponse) resp;
                        Log.d("[Authenticator]", "errorCode: " + errorResponse.getErrorCode());
                        Log.d("[Authenticator]", "errorMessage: " + errorResponse.getErrorMessage());

                    }
                    Log.d("[Authenticator]", "credential.getResponse().getClass() " + resp.getClass());

                    Log.d("[Authenticator]", "credential.getResponse().getClientDataJSON() " + credential.getResponse().getClientDataJSON());
                }
                else
                    Log.d("[Authenticator]", "fido2Response2 is null ");

                //AuthenticatorAttestationResponse response = AuthenticatorAttestationResponse.deserializeFromBytes(fido2Response);

                //String keyHandleBase64 = Base64.encodeToString(response.serializeToBytes(), Base64.DEFAULT);
                //String clientDataJson = new String(response.getClientDataJSON(), Charsets.UTF_8);
                //String attestationObjectBase64 = Base64.encodeToString(response.getAttestationObject(), Base64.DEFAULT);
                //Log.d("[Authenticator]", "keyHandleBase64: " + keyHandleBase64);
                //Log.d("[Authenticator]", "clientDataJson: " + clientDataJson);
                //Log.d("[Authenticator]", "attestationObjectBase64: " + attestationObjectBase64);
            }
        }
    }

    public void register(Activity activity, String data) {

        System.out.println("Authenticator.register() called in native context!");
        Fido2ApiClient fido2ApiClient = Fido.getFido2ApiClient(activity.getApplicationContext());


        Log.d("[Authenticator]", "Building PublicKeyCredentialCreationOptions...");
        PublicKeyCredentialCreationOptions publicKeyCredentialCreationOptions =
                Converter.parsePublicKeyCredentialCreationOptions(data);

/*
        DomainVerificationManager manager =
                null;

        System.out.println("Before sdk check sdk: " + android.os.Build.VERSION.SDK_INT);
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S) {
            manager = activity.getSystemService(DomainVerificationManager.class);

            DomainVerificationUserState userState =
                    null;
            try {
                userState = manager.getDomainVerificationUserState(activity.getPackageName());
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }

            Map<String, Integer> hostToStateMap = userState.getHostToStateMap();
            List<String> verifiedDomains = new ArrayList<>();
            List<String> selectedDomains = new ArrayList<>();
            List<String> unapprovedDomains = new ArrayList<>();

            System.out.println("Checking verification of domains");
            System.out.println("hostToStateMap size: " + hostToStateMap.keySet().size());
            for (String key : hostToStateMap.keySet()) {
                Integer stateValue = hostToStateMap.get(key);
                if (stateValue == DomainVerificationUserState.DOMAIN_STATE_VERIFIED) {
                    // Domain has passed Android App Links verification.
                    verifiedDomains.add(key);
                } else if (stateValue == DomainVerificationUserState.DOMAIN_STATE_SELECTED) {
                    // Domain hasn't passed Android App Links verification, but the user has
                    // associated it with an app.
                    selectedDomains.add(key);
                } else {
                    // All other domains.
                    unapprovedDomains.add(key);
                }
            }
            System.out.println("VerifiedDomains");
            verifiedDomains.forEach(s -> System.out.println("VER: " + s));
            System.out.println("selectedDomains");
            selectedDomains.forEach(s -> System.out.println("VER: " + s));
            System.out.println("unapprovedDomains");
            unapprovedDomains.forEach(s -> System.out.println("VER: " + s));
        }

*/


        if (publicKeyCredentialCreationOptions != null) {
            Task<Boolean> isAvailable = fido2ApiClient.isUserVerifyingPlatformAuthenticatorAvailable();
            isAvailable.addOnSuccessListener(new OnSuccessListener<Boolean>() {
                @Override
                public void onSuccess(Boolean aBoolean) {
                    System.out.println("Task<Boolean> isAvailable result: " + aBoolean);
                }
            });

            System.out.println("fido2ApiClient toString: " + fido2ApiClient.getApiKey().toString());
            System.out.println("fido2ApiClient zaa: " + fido2ApiClient.getApiKey().zaa());

            Task<PendingIntent> fido2PendingIntentTask =
                    fido2ApiClient.getRegisterPendingIntent(publicKeyCredentialCreationOptions);
            fido2PendingIntentTask.addOnCompleteListener(new OnCompleteListener<PendingIntent>() {
                @Override
                public void onComplete(@NonNull Task<PendingIntent> task) {
                    Log.d("[Authenticator]", "Pending task is complete");
                }
            });
            fido2PendingIntentTask.addOnFailureListener(new OnFailureListener() {
                @Override
                public void onFailure(@NonNull Exception e) {
                    Log.d("[Authenticator]", "Pending task failed");
                }
            });
            fido2PendingIntentTask.addOnSuccessListener(new OnSuccessListener<PendingIntent>() {
                @Override
                public void onSuccess(PendingIntent pendingIntent) {
                    Log.d("[Authenticator]", "Pending task success");
                    // Start a FIDO2 registration request.
                    try {
                        Log.d("[Authenticator]", "PendingIntent: " + pendingIntent.toString());
                        Log.d("[Authenticator]", "Sending PendingIntent...");
                        if (pendingIntent != null) {
                            IntentSender intentSender = pendingIntent.getIntentSender();


                            // Start a FIDO2 registration request.
                            activity.startIntentSenderForResult(
                                    pendingIntent.getIntentSender(),
                                    REGISTER_REQUEST_CODE,
                                    null, // fillInIntent,
                                    0, // flagsMask,
                                    0, // flagsValue,
                                    PendingIntent.FLAG_UPDATE_CURRENT //extraFlags
                            );


                        }
                    } catch (IntentSender.SendIntentException e) {
                        e.printStackTrace();
                    }
                    //                  pendingIntent.launchPendingIntent(this, REQUEST_CODE_REGISTER);
                    // For a FIDO2 sign request.
                    // fido2PendingIntent.launchPendingIntent(this, REQUEST_CODE_SIGN);
                }
            });
        } else {
            Log.e("[Fido Authenticator]", "Internal Error");
        }
    }
}
