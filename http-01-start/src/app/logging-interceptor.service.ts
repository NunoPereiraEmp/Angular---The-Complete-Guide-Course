 import { HttpInterceptor, HttpHandler, HttpRequest, HttpEvent, HttpResponse } from '@angular/common/http';
import { tap } from 'rxjs/operators';


export class LoggingInterceptorService implements HttpInterceptor {
    constructor() {}

    intercept(req: HttpRequest<any>, next: HttpHandler) {
        console.log('Outgoing Request');
        console.log(req.url);
       console.log(req.headers);
        return next.handle(req).pipe(
            tap(event => {
                if (event instanceof HttpResponse) {
                    console.log('incoming response');
                    console.log(event.body);
                }
            })
        );
    }
}