public class ConnectOrgOneHttpClassTwo {
    
    
    public ConnectOrgOneHttpClassTwo(){
       
        //data 
        Http hp = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        //req.setEndpoint('callout:org1connect/services/apexrest/smb/customer/relatedcontacts/realtime/SMB-CustID-00017');
        //req.setEndpoint('callout:org1connect/services/apexrest/smb/customers');
        req.setEndpoint('callout:org1connect/services/apexrest/yodhagtc/');   
        HttpResponse resp = hp.send(req);
        
        String jsonResp = resp.getBody();
        System.debug('JSON RESP: '+jsonResp);
        
    }
    
    
    
    
   
}