import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Data, Params, Router } from '@angular/router';

import { ServersService } from '../servers.service';

@Component({
  selector: 'app-server',
  templateUrl: './server.component.html',
  styleUrls: ['./server.component.css']
})
export class ServerComponent implements OnInit {
  server: {id: number, name: string, status: string};

  constructor(private serversService: ServersService, private route:ActivatedRoute, private router: Router) {

   }

  ngOnInit() {

    this.route.data.subscribe((data:Data) => {
      this.server= data['server'];
      
    });
    /*
    const id = this.route.snapshot.params['id'];
    //this.server = this.serversService.getServer(id);

    //para atualizar o id usamos o evento subscribe  sempre que os params mudam
    this.route.params.subscribe((params : Params) => {
      //em +params['id']); o + é para converter o id em int já que o params dá string
      this.server = this.serversService.getServer(+params['id']);

    })*/
  }

  onEdit(){
    // caminho relativo -> this.router.navigate(['/servers',this.server.id,'edit' ]); 

    this.router.navigate(['edit'], {relativeTo:this.route, queryParamsHandling: 'preserve'});
  }

}
