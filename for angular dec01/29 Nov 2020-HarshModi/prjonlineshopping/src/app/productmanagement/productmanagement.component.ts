import { Component, OnInit } from '@angular/core';
import { productservice } from '../services/productservice';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Products } from '../models/Products.model';
import { Image } from '../models/image.model';

@Component({
  selector: 'app-productmanagement',
  templateUrl: './productmanagement.component.html',
  styleUrls: ['./productmanagement.component.css']
})
export class ProductmanagementComponent implements OnInit {
  products: Products[];
  prod: Products = new Products();
  error: string;
  deleteProductId: number;
  selectedFile = null;
  errorMessage;
  // imageUrl: string = '/assets/images/download.png';
  // fileToUpload: File = null;
  // mdlSampleIsOpen: boolean = false;
  // productImages: Image[] = new Array<Image>();

  constructor(private prodservice: productservice, private modalService: NgbModal) { }

  ngOnInit(): void {
    this.GetProducts();
  }
  GetProducts() {
    this.prodservice.getProduct().subscribe((data: any) => {
      this.products = data;
    }
    ,
    (error) => {   
      console.error('Error caught in GetProduct of ProductManagement Component')
      this.errorMessage = error;
     // this.loading = false;

    }
    );
  }

  DeleteConfirmation(id) {
    this.deleteProductId = id;
  }

  DeleteProduct() {
    this.prodservice.deleteProduct(this.deleteProductId).subscribe((response: any) => {
      this.GetProducts();
    }
    ,
    (error) => {   
      console.error('Error caught in DeleteProduct of ProductManagemet Component')
      this.errorMessage = error;
     // this.loading = false;

    });
  }

  GetProductById(id) 
  {
    this.prodservice.getProductbyid(id).subscribe((response: any) => {
      // this.addUpdate = 'Update';
      this.prod = response;
    }
    ,
    (error) => {   
      console.error('Error caught in getProductid of ProductManagement Component')
      this.errorMessage = error;
     // this.loading = false;

    }
    );
  }

  // handleFileInput(file: FileList) {
  //   debugger;
  //   this.fileToUpload = file.item(0);
  //   var image: Image = {
  //     ImageID: 0,
  //     IsDefault: false,
  //     ProductID: this.prod.ProductID,
  //     ProductImage: this.fileToUpload.name
  //   }
  //   this.productImages.push(image);
  //   var reader = new FileReader();
  //   reader.onload = (event: any) => {
  //     this.imageUrl = event.target.result;
  //   };
  //   reader.readAsDataURL(this.fileToUpload);
  // }

  // SaveImages() {
  //   debugger;
  //   this.prodservice.insertProductImage(this.productImages, this.prod.ProductID, true).subscribe((response: any) => {
  //     if (response == 'Success') {
  //       alert('ProductImage Saved Succesfully');
  //       var reader = new FileReader();
  //       reader.onload = (event: any) => {
  //         this.imageUrl = event.target.result;
  //       };
  //       reader.readAsDataURL(this.fileToUpload);
  //     }
  //     else {
  //       this.error = response;
  //     }
  //   });
  // }

  open(content) {
    this.modalService.open(content);
  }

  openDeletePopup(contentdelete, id) {
    this.deleteProductId = id;
    this.modalService.open(contentdelete);
  }

}
