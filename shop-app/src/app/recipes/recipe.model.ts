import { Ingredient } from "../shared/ingredient.model";

//blueprinte to objects we create, neste caso para recipes
export class Recipe {
  public name: string;
  public description: string;
  public imagePath: string;
  public ingredients!: Ingredient[];

  constructor(name: string, desc: string, imagePath: string, ingreddients: Ingredient[]) {
    this.name = name;
    this.description = desc;
    this.imagePath = imagePath;
    this.ingredients = ingreddients;
  }


}
