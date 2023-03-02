import { Component } from '@angular/core';

@Component({
  selector: 'app-root',//html tag, chamado no index.html
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  name = 'Nuno';//data binding, muda o html em real time
}
