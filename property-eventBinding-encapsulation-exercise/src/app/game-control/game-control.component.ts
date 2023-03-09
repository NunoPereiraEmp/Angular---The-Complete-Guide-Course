import { Component, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-game-control',
  templateUrl: './game-control.component.html',
  styleUrls: ['./game-control.component.css']
})
export class GameControlComponent {
  @Output()
  intervalFired= new EventEmitter<number>();
  interval: number=0;
  lastNumber=0;

  //apenas incrementa numeros a cada segundo
  onStartGame(){
    this.interval= setInterval(() => {
      this.intervalFired.emit(this.lastNumber++);
      
    }, 1000);

  }

  onPauseGame(){
    clearInterval(this.interval);

  }

}
