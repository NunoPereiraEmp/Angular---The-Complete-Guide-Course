import { Component, EventEmitter, Output } from '@angular/core';
import { AccountsService } from '../account.service';
import { AccountComponent } from '../account/account.component';
import { LoggingService } from '../logging.service';

@Component({
  selector: 'app-new-account',
  templateUrl: './new-account.component.html',
  styleUrls: ['./new-account.component.css'],
  //providers:[LoggingService]
})
export class NewAccountComponent {

  constructor(private loggingService: LoggingService, private accountService: AccountsService) {
    accountService.statusUpdated.subscribe(
      (status:string)=> alert('New status '+status)
    );
   }

  onCreateAccount(accountName: string, accountStatus: string) {

    this.accountService.addAccount(accountName, accountStatus);
    //this.loggingService.logStatusChange("ola "+accountStatus);
    //LoggingService.testeSt("static " +accountName);
  }
}
