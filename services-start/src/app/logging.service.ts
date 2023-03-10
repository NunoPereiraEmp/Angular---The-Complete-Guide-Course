export class LoggingService{   
    
    logStatusChange(status:string){
        console.log('A server status changed, new status: ' + status);
    }

    static testeSt(status:string){
        console.log('A server status changed, new status: ' + status);
    }

}