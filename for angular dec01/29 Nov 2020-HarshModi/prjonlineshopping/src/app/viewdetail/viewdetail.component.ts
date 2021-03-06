import { Component, OnInit } from '@angular/core';
import { Products } from '../models/Products.model';
import { productservice } from '../services/productservice';
import { Router } from '@angular/router';
import { CartModel } from '../models/Cart.model';

@Component({
  selector: 'app-viewdetail',
  templateUrl: './viewdetail.component.html',
  styleUrls: ['./viewdetail.component.css']
})
export class ViewdetailComponent implements OnInit {
  product: Products = new Products();
  cartQuantity: number = 1;
  errorMessage;
  constructor(private prodservice: productservice, private router: Router) { }

  ngOnInit(): void {
    let url = this.router.url;
    this.prodservice.getProductbyid(Number(url.split('/')[2])).subscribe((data: any) => {
      this.product = data;
    },
    
    (error) => {   
      console.error('Error caught in viewdetail Component')
      this.errorMessage = error;
     // this.loading = false;

    });
  }

  AddToCart(productModel) {
    if (!sessionStorage.getItem('userId')) {
      this.router.navigate(['login']);
      alert('Login first to add to Cart.');
      return;
    }
    let model = {
      ProductID: productModel.ProductID,
      TotalPrice: productModel.ProductPrice,
      Quantity: this.cartQuantity,
      UserID: sessionStorage.getItem('userId')
    };
    this.prodservice.AddToCart(model).subscribe((response: any) => {
      if (response == 'Success') {
        alert('Product Successfully added to cart.');
      }
      else if (response == 'ProductID Already Exists in Cart.') {
        alert(response);
      }
      else {
        alert(response);
      }
    }
    ,
    (error) => {   
      console.error('Error caught in Addtocart of viewdetail Component')
      this.errorMessage = error;
     // this.loading = false;

    });
  }
  AddToWishlist(productModel) {
    if (!sessionStorage.getItem('userId')) {
      this.router.navigate(['login']);
      alert('Login first to add to Wishlist.');
      return;
    }
    let model = {
      ProductID: productModel.ProductID,
      UserID: sessionStorage.getItem('userId')
    };
    this.prodservice.AddToWishlist(model).subscribe((response: any) => {
      if (response == 'Success') {
        alert('Product Successfully added to Wishlist.');
      }
      else {
        alert('Product already Present in the WishList..')
      }
    }
    ,
    (error) => {   
      console.error('Error caught in AddtoWishlist of ViewDetail Component')
      this.errorMessage = error;
     // this.loading = false;

    });
  }
}
