import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, CanActivateChild, Router, RouterStateSnapshot, UrlTree } from "@angular/router";
import { Observable } from "rxjs/Observable";
import { AuthService } from "./auth.service";

//estas classes  guards servem para que o utilizador não entre em páginas/routes que não são devidas,
//neste caso não permite a adição de servers

@Injectable()
export class AuthGuard implements CanActivate, CanActivateChild {
    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {
        //verificar se o utilizador está logged in
        return this.authService.isAuthenticated()
            .then(
                (authenticated: boolean) => {
                    if (authenticated) {
                        return true;
                    }
                    else {
                        this.router.navigate(['']);
                        return false;

                    }
                }
            );

    }

    constructor(private authService: AuthService, private router: Router) { }


    canActivateChild(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {
        return this.canActivate(route, state);
    }
}