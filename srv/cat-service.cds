using { my.bookshop as my } from '../db/schema';
service CatalogService @(path:'/browse') {

  @readonly entity Books as SELECT from my.Books {*,
    author.name as author
    } excluding { createdBy, modifiedBy };

  @readonly entity Authors as select from my.Authors {*,books.descr as books} excluding { createdBy, modifiedBy };

    action submitOrder (book:Books:ID, amount: Integer);
  }