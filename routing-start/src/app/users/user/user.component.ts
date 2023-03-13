import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Subscription } from 'rxjs-compat';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit, OnDestroy {
  user: { id: number, name: string };
  paramsSubscription: Subscription;

  constructor(private route: ActivatedRoute) { }

  ngOnDestroy(): void {
    //o angular faz isto por nos, mas se criarmos os nossos proprios observables temos de os destruir no final
    this.paramsSubscription.unsubscribe();
  }

  ngOnInit() {
    //obtemos o id e o name pelo url
    this.user = {
      id: this.route.snapshot.params['id'],
      name: this.route.snapshot.params['name']
    };
    //observable permitenos trabalhar com asynchronous tasks, portanto faz o subscribe de um objeto que 
    //pode mudar no futuro, então executa codigo quando isso aconteçe sem ter de esperar por esse codigo
    //é sempre executado sempre que a data é enviada para um observable, portanto sempre que os parametros mudam
    // que neste caso os var é do tipo Params
    this.paramsSubscription= this.route.params.subscribe(
      (params: Params) => {
        this.user.id = params['id'];
        this.user.name = params['name'];
      }
    );
  }

}
