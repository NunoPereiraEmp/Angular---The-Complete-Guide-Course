//blueprinte to objects we create, neste caso para recipes
export class Recipe {
    public name:string;
    public description:string;
    public imagePath: string;

    constructor(name: string, desc: string, imagePath:string) {
        this.name=name;
        this.description= desc;
        this.imagePath= imagePath;
     }


}