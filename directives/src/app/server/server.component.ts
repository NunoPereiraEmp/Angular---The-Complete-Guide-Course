//componente é uma classe , export é para podermos usar a classe fora do ficheiro
//este decorator diz ao angular que não é so uma classe 
//mas também um component, @Component
import { Component } from "@angular/core";

@Component({
    //selector é uma html tag, para usar noutros locais
    selector: 'app-server',
    templateUrl: './server.component.html',
    styles: [
        `
        .online{
            color: white;
        }
        `
    ]
})
export class ServerComponent{
    serverId: number=10;
    serverStatus: string='ofline';

    constructor(){
        this.serverStatus= Math.random()>0.5? 'online': 'ofline';
    }

    getServerStatus(){
        return this.serverStatus;
    }

    getColor(){
        return this.serverStatus === 'online' ? 'green' : 'red';
    }

}