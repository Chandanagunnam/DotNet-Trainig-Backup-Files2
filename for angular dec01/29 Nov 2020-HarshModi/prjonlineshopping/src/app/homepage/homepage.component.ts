import { Component, OnInit } from '@angular/core';
import { productservice } from '../services/productservice';
import { Products } from '../models/Products.model';

@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html'
})
export class HomepageComponent implements OnInit {
  products: Products[];
  errorMessage;
  constructor(private prodservice: productservice) { }

  ngOnInit() {
    this.GetProducts();
  }

  GetProducts() {
    this.prodservice.getProduct().subscribe((data: any) => {
      this.products = data;
    }
    ,
    (error) => {   
      console.error('Error caught in GetProduct of homepage Component')
      this.errorMessage = error;
     // this.loading = false;

    });
  }

  AddToCart(productModel) {
    let model = {
      ProductID: productModel.ProductID,
      TotalPrice: productModel.ProductPrice,
      Quantity: 1,
      UserID: sessionStorage.getItem('userId')
    };
    this.prodservice.AddToCart(model).subscribe((response: any) => {
      if (response == "Success") {
        alert('Product Successfully added to cart.');
      }
    },
    
    (error) => {   
      console.error('Error caught in Addtocart of homepageComponent')
      this.errorMessage = error;
     // this.loading = false;

    });
  }
}
