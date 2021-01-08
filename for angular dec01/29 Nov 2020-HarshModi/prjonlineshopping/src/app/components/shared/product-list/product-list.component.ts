import { Component, OnInit } from '@angular/core';
import { Products } from '../../../models/Products.model';
import { productservice } from '../../../services/productservice';
import { userproductservice } from '../../../services/userproduct.service';
import { FilterView } from '../../../models/FilterView.model';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {
  compareBtn: string = 'Add to Compare';
  products: Products[] = new Array<Products>();
  filterView: FilterView = new FilterView();
  errorMessage;
  constructor(private prodservice: productservice, private userproductservice: userproductservice) { }

  ngOnInit(): void {
    this.GetUserProducts(this.filterView);
  }
  
 //
  GetUserProducts(filterModel) {
    this.userproductservice.getUserProducts(filterModel).subscribe((data: any) => {
      this.products = data;
    },
    
    (error) => {   
      console.error('Error caught in GetUserProducts of Productlist Component')
      this.errorMessage = error;
     // this.loading = false;

    }
    );
  }

  ClearFilter() {
    this.filterView = new FilterView();
    this.GetUserProducts(this.filterView);
  }

  // calling the service from productservice.ts to compare products by id
  addtoCompare(productId) {
    this.prodservice.compareProduct(productId).subscribe((data: any) => {
      alert('Added to compared Product.');
    }
    ,
    (error) => {   
      console.error('Error caught in addtocompare of Productlist Component')
      this.errorMessage = error;
     // this.loading = false;

    });
  }
}
