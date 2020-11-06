import { Component } from '@angular/core';

@Component({
    selector: 'app-music-player',
    templateUrl: './music-player.component.html',
    styleUrls: ['./music-player.component.scss']
})
/** musicPlayer component*/
export class MusicPlayerComponent {
    /** musicPlayer ctor */
    constructor() {

    }
  showMe = true;



  displayMe = function () {
    this.showMe = !this.showMe;
    console.log(this.showMe);
  }
}
