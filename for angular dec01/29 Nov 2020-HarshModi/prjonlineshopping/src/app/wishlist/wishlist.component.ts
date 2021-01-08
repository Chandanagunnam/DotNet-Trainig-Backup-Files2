import { Component, OnInit } from '@angular/core';
import { productservice } from '../services/productservice';
import { WishlistModel } from 'src/app/models/wishlist.model';
import { Products } from '../models/Products.model';
@Component({
  selector: 'app-wishlist',
  templateUrl: './wishlist.component.html',
  styleUrls: ['./wishlist.component.css']
})
export class WishlistComponent implements OnInit {
  deleteProductId: number;
  deletewishid: number;
  products: Products[];
  wishlistmodel: WishlistModel[] = new Array<WishlistModel>();
  errorMessage;
  constructor(private prodservice: productservice) { }

  ngOnInit(): void {
    debugger;
    this.getwishproducts();

  }
  getwishproducts(){
    let userId = Number(sessionStorage.getItem('userId'));
    this.prodservice.getWishlistProduct(userId).subscribe((data: any) => {
      debugger;
      this.wishlistmodel = data;
    },
    
    (error) => {   
      console.error('Error caught in getwishproducts of wishlist Component')
      this.errorMessage = error;
     // this.loading = false;

    });

  }
  

  handleRemoveFromWishlist(id){
   this.prodservice. RemoveFromWishList(this.deletewishid = id).subscribe((response: any) => {
     if (response == 'Success'){
       alert('Product successfully removed from Wishlist');
       this.getwishproducts();
     }
    }
    ,
    (error) => {   
      console.error('Error caught in handleRemoveFromWishlist of Wishlist Component')
      this.errorMessage = error;
     // this.loading = false;

    })
    ;
   }
   
}
