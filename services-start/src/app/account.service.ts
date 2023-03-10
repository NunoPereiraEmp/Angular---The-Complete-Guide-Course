import { EventEmitter, Injectable } from "@angular/core";
import { LoggingService } from "./logging.service";

//como queremos injetar isto private loggingService:LoggingService precisamos de alguma metadata
//e o injectable dá-nos isso, é mesmo próprio
@Injectable()
export class AccountsService {
    accounts = [
        {
            name: 'Master Account',
            status: 'active'
        },
        {
            name: 'Testaccount',
            status: 'inactive'
        },
        {
            name: 'Hidden Account',
            status: 'unknown'
        }
    ];
    statusUpdated= new EventEmitter<string>();

    constructor(private loggingService:LoggingService){}

    addAccount(name: string, status: string) {
        this.accounts.push({name:name, status: status});
        this.loggingService.logStatusChange(status);
    }

    updateStatus(id:number,  status:string){
        this.accounts[id].status = status;
        this.loggingService.logStatusChange(status);
    }


}