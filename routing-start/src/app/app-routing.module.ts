import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { AuthGuard } from "./auth-guard.service";
import { ErrorPageComponent } from "./error-page/error-page.component";
import { HomeComponent } from "./home/home.component";
import { PageNotFoundComponent } from "./page-not-found/page-not-found.component";
import { canDeactivateGuard } from "./servers/edit-server/can-deactivate-guard.service";
import { EditServerComponent } from "./servers/edit-server/edit-server.component";
import { ServerResolver } from "./servers/server/server-resolver.service";
import { ServerComponent } from "./servers/server/server.component";
import { ServersComponent } from "./servers/servers.component";
import { UserComponent } from "./users/user/user.component";
import { UsersComponent } from "./users/users.component";

// temos de ter um caminho  e  temos de ter uma action ->component: UsersComponent
//'users/:id com o :id fica dinamico, recebe uma var
//como utilizamos os children temos de utilizar no html o <router-outlet></router-outlet>, é ai que 
//o children vai ser loaded
// o {path:'**' significa todas as entradas erradas vão entrar nestes dois *** e vão ser redirecionadas
const appRoutes: Routes = [
    { path: '', component: HomeComponent },
    {
        path: 'users', component: UsersComponent, children: [
            { path: ':id/:name', component: UserComponent },
        ]
    },
    {
        path: 'servers',canActivateChild:[AuthGuard] ,
        //canActivate: [AuthGuard], 
        component: ServersComponent, children: [
            { path: ':id', component: ServerComponent, resolve: { server: ServerResolver } },
            { path: ':id/edit', component: EditServerComponent, canDeactivate: [canDeactivateGuard] },
        ]
    },
   // { path: 'not-found', component: PageNotFoundComponent },
    { path: 'not-found', component: ErrorPageComponent, data:{message: "Page not found"} },
    { path: '**', redirectTo: '/not-found' }

];


@NgModule({
    imports:[
       //for old browsers RouterModule.forRoot(appRoutes, {useHash: true})
       RouterModule.forRoot(appRoutes)
    ],
    exports:[RouterModule]
})
export class AppRoutingModule {

}