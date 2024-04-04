//this class will make outbound callout
public class ConnectOrgOneHttpClass {
    //ORG 1 related//
    public string ORG_URL =  'https://smbcrompton-dev-ed.develop.my.salesforce.com/services/oauth2/token';
    public string REST_APX_CLS_URL = 'https://smbcrompton-dev-ed.develop.my.salesforce.com/services/apexrest/smb/customer/relatedcontacts/realtime/SMB-CustID-00017';
    public string userName= 'admin@crompton.co.in.smbdevorg';
    public string password = 'Pass@1234';
    public string consumerKey = '3MVG9pRzvMkjMb6kcJ5Cbk0_zEz3N9PVmmS1jMMwaKVLFpThMW3vtYXbOxLKPkoYzVsVo832z4AHdFJ68iRiK';
    public string secretKey= '82110444F18BBD5FE9B829FB72821CC506A9B7C96D5354E9629216E5A8C19AB9'; 
    
    public ConnectOrgOneHttpClass(){
        string accessToken = doConnectGETaccessToken();
        //data 
        Http hp = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(REST_APX_CLS_URL);
        req.setHeader('Authorization', 'Bearer ' + accessToken);
		req.setHeader('Content-Type', 'application/json');        
        HttpResponse resp = hp.send(req);
        
        String jsonResp = resp.getBody();
        System.debug('JSON RESP: '+jsonResp);
        
    }
    
    //this method will connect org 1 and return access token
    public string doConnectGETaccessToken(){
        //Request an Access Token
        Http hp = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(ORG_URL);
        req.setMethod('POST');
        string oAuthbody = 'grant_type=password&client_id='+consumerKey+
            '&client_secret='+secretKey+
            '&username='+userName+
            '&password='+password;
        req.setBody(oAuthbody);
        HttpResponse resp = hp.send(req);
        system.debug('CHECK RESP:'+resp);
        String jsonResp = resp.getBody();
        System.debug('JSON RESP: '+jsonResp);
        jsonWrapper jsonObj = (jsonWrapper)JSON.deserialize(jsonResp, jsonWrapper.class);
        System.debug('JSON obJ: '+jsonObj);
        
        return jsonObj.access_token;
    }
    
    
    public class jsonWrapper{
        public string access_token {get;set;}
        public string instance_url {get;set;}
        public string id {get;set;}
        public string token_type {get;set;}
        public string issued_at {get;set;}
        public string signature {get;set;}
    }
}