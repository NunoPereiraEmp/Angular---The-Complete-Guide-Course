import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'shop-app';

  //que feature vai ser mostrada
  loadedFeature='recipe';


  constructor(){
  }

  onNavigate(feature:string){
    this.loadedFeature= feature;

  }
}
