import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DepartmentcrudComponent } from './departmentcrud.component';

describe('DepartmentcrudComponent', () => {
  let component: DepartmentcrudComponent;
  let fixture: ComponentFixture<DepartmentcrudComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DepartmentcrudComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DepartmentcrudComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
