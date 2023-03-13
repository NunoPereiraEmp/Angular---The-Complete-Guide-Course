export class AuthService{
    loggedIn= false;

    //este promise é para fazer um fake que demora 800 milisegundos
    isAuthenticated(){
        const promise=  new Promise(
            (resolve, rejected)=>{
                setTimeout(()=>{
                    resolve(this.loggedIn);
                }, 800);
            }
        );
        return promise;
    }

    login(){
        this.loggedIn= true;
    }

    logout(){
        this.loggedIn=false;
    }
}