import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  title = 'practicing-directives';
  showSecret:boolean= false;
  log: number[] = [];
  logString: string[]=[];

  onToggleDetails() {
    this.showSecret=!this.showSecret;
    this.log.push(this.log.length+1);
  }

  onToggleDetailsTime(){
    this.showSecret=!this.showSecret;
    this.logString.push(new Date().toDateString());
  }
}
