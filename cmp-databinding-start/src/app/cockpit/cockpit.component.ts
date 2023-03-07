import { Component, EventEmitter, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-cockpit',
  templateUrl: './cockpit.component.html',
  styleUrls: ['./cockpit.component.css']
})

//onde  adicionamos o nome , conteudo e onde carregamos nos butões
export class CockpitComponent implements OnInit {

  //criar os eventos, o () é para criar um novo EventEmitter object
  //o decorator permite passar o serverCreated para fora do component, portanto é especifico para componentes
  @Output()
  serverCreated = new EventEmitter<{serverName:string, serverContent:string}>();
  @Output('bpCreated')
  blueprintCreated = new EventEmitter<{serverName:string, serverContent:string}>();
  newServerName = '';
  newServerContent = '';

  constructor() { }

  ngOnInit(): void {
  }

  onAddServer(nameIput : HTMLInputElement){
    //emite um novo evento deste tipo, e dentro tem o conteudo, neste caso as strings
    this.serverCreated.emit({serverName: nameIput.value, serverContent: this.newServerContent});
  }

  onAddBlueprint(){
    this.blueprintCreated.emit({serverName: this.newServerName, serverContent: this.newServerContent});
  }

 
}
