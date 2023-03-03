import { Component, OnInit} from '@angular/core';

@Component({
  //podemos converter o selector component como um atributo
  // app-servers  ficando desta forma [app-servers] fica assim  <div app-servers></div>
  //ou .app-servers <div class="app-servers"></div>
  //e basicamente em app.component.html pomos o app-server dentro de
  //um div
  //selector: '.app-servers',
  //selector: '[app-servers]',
  selector: 'app-servers',
  
   //podemos substituir o templateUrl para template para por
  //exemplo para escrever uma string de codigo html
 // template: '<app-server></app-server><app-server></app-server>',
  templateUrl: './servers.component.html',
  styleUrls: ['./servers.component.css']
})
export class ServersComponent implements OnInit {
  allowNewServer:boolean = false;
  serverCreationStatus:string='No server was created!';
  serverName="test server";
  serverCreated=false;
  servers = ['TestServer', 'Testeserver2']

  constructor(){
    setTimeout(()=>{
      this.allowNewServer=true; 
    },2000)
    
  }

  ngOnInit() {
    
  }

  onCreateServer(){
    this.serverCreated=true;
    this.servers.push(this.serverName);
    this.serverCreationStatus= "Server was created! Name is "+ this.serverName;
    console.log(this.serverName);
  }

  //quero receber aqui coisas por parametro, para isso no
  //html como $event na função chamada mo html
  onUpdateServerName( event:Event){
    this.serverName=(<HTMLInputElement>event.target).value;

  }

}
