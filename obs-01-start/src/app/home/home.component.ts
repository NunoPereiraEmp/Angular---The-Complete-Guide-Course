import { Component, OnDestroy, OnInit } from '@angular/core';
import { interval, Subscription, Observable } from "rxjs";
import { filter, map } from 'rxjs/operators';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit, OnDestroy {
  private firstObsSubscription: Subscription;

  constructor() { }

  ngOnDestroy(): void {
    this.firstObsSubscription.unsubscribe();
  }

  ngOnInit() {
   /*this.firstObsSubscription= interval(1000).subscribe((count) => {
      console.log(count);
    });*/
    

    //this.observableErrorHandling();
    //this.observablePipeHandling();
    this.observableFilterHandling();

  }


   //map operator
   observableFilterHandling() {
    //observable feito á mão
    //, observer-Z o que vai ser informado sobre as mudanças de dados, como dados, erros e etc...
    const customIntervalObservable=Observable.create  (observer => {
      let count=0;
      setInterval(() => {
        //next-> emit new value, quando o observer passa a saber do novo valor
        observer.next(count);
        count++;
      }, 1000);
    });

    
    this.firstObsSubscription= customIntervalObservable.pipe(filter(data =>{
      return data>0;
    }),map((data: number)=>{
      return 'Round: ' + (data+1);
    })).subscribe((data) => {
      console.log(data);
    });
  }



  //map operator
  observablePipeHandling() {
    //observable feito á mão
    //, observer-Z o que vai ser informado sobre as mudanças de dados, como dados, erros e etc...
    const customIntervalObservable=Observable.create  (observer => {
      let count=0;
      setInterval(() => {
        //next-> emit new value, quando o observer passa a saber do novo valor
        observer.next(count);
        count++;
      }, 1000);
    });

    
    this.firstObsSubscription= customIntervalObservable.pipe(map((data: number)=>{
      return 'Round: ' + (data+1);
    })).subscribe((data) => {
      console.log(data);
    });
  }


  observableNormalHandling() {
    //observable feito á mão
    //, observer-Z o que vai ser informado sobre as mudanças de dados, como dados, erros e etc...
    const customIntervalObservable=Observable.create  (observer => {
      let count=0;
      setInterval(() => {
        //next-> emit new value, quando o observer passa a saber do novo valor
        observer.next(count);
        count++;
      }, 1000);
    });

    
    this.firstObsSubscription= customIntervalObservable.subscribe((data) => {
      console.log(data);
    });
  }

  observableErrorHandling() {
    const customIntervalObservable=Observable.create(observer => {
      let count=0;
      setInterval(() => {
        //next-> emit new value, quando o observer passa a saber do novo valor
        observer.next(count);
        //observer.complete(); é simplesmente para acabar o observable
        //if(count==2) observer.complete();
        if(count>3){
          observer.error(new Error('Count > 3'));
          
        }
        count++;
      }, 1000);
    });
    this.firstObsSubscription= customIntervalObservable.subscribe((data) => {
      console.log(data);
    }, error=>{
      alert(error.message);
    }
    /* quando faz completed podemos fazer qualquer coisa
    ,
    () => {
      console.log('complete');
    }*/
    );
  }

}
