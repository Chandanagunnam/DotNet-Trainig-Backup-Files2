import { Component, OnInit } from '@angular/core';
import { Products } from '../models/Products.model';
import { productservice } from '../services/productservice';

@Component({
  selector: 'app-compareproducts',
  templateUrl: './compareproducts.component.html',
  styleUrls: ['./compareproducts.component.css']
})
export class CompareproductsComponent implements OnInit {
  productdata: Products[] = new Array<Products>();
  errorMessage;

  constructor(private prodservice: productservice) { }

  ngOnInit() {
    this.getdata();
  }
  getdata() {
    this.prodservice.getCompareProduct().subscribe((data: any) => {
      this.productdata = data;
    }
    ,
    (error) => {   
      console.error('Error caught in compareproducts Component')
      this.errorMessage = error;
     // this.loading = false;

    });
  }
}