import { Component, OnInit} from '@angular/core';

@Component({
  selector: 'app-servers',
   //podemos substituir o templateUrl para template para por
  //exemplo para escrever uma string de codigo html
 // template: '<app-server></app-server><app-server></app-server>',
  templateUrl: './servers.component.html',
  styleUrls: ['./servers.component.css']
})
export class ServersComponent implements OnInit {



  ngOnInit() {
    throw new Error('Method not implemented.');
  }

}
