import { Component, OnDestroy, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { Post } from './post.model';
import { PostsService } from './posts.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit, OnDestroy {
  loadedPosts: Post[] = [];
  isFetching:boolean;
  error = null;
  private errorSub : Subscription;

  constructor(private http: HttpClient, private postService: PostsService) {}

  ngOnDestroy(): void {
    this.errorSub.unsubscribe();
  }

  ngOnInit() {
    this.errorSub= this.postService.error.subscribe(errorMessage=>{
      this.error= errorMessage;
    })
    this.isFetching=true;
    this.postService.fetchPosts().subscribe(posts=>{
      this.isFetching=false;
      this.loadedPosts=posts;
    },error=>{
      this.isFetching=false;
      this.error=error.message;
    });
  }

  onCreatePost(postData: Post) {
    // Send Http request
    this.postService.createAndStorePost(postData.title, postData.content);
  }

  onFetchPosts() {
    // Send Http request
    this.isFetching=true;
    this.postService.fetchPosts().subscribe(posts=>{
      this.isFetching=false;
      this.loadedPosts=posts;
    },error=>{
      this.isFetching=false;
      this.error=error.message;
    });
  }

  onClearPosts() {
    // Send Http request
    this.postService.deletPosts().subscribe(()=>{
      this.loadedPosts=[]
    })
  }

  onHandlerError(){

    this.error=null;
  }

 
}
