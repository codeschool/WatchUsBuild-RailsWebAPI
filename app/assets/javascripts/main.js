App = Ember.Application.create();

App.Router.map(function() {
  this.resource('book', { path: '/books/:book_id'});
  this.resource('genre', { path: '/genres/:genre_id'});
  this.resource('reviews', function() {
    this.route('new');
  });
});

App.IndexRoute = Ember.Route.extend({
  model: function() {
    return Ember.RSVP.hash({
      books: this.store.findAll('book'),
      genres: this.store.findAll('genre')
    });
  },
  setupController: function(controller, model) {
    controller.set('books', model.books);
    controller.set('genres', model.genres);
  }
});

App.IndexController = Ember.Controller.extend({});

App.BooksController = Ember.ArrayController.extend({
  sortProperties: ['title']
});
App.GenresController = Ember.ArrayController.extend({
  sortProperties: ['name']
});


App.ReviewsNewRoute = Ember.Route.extend({
  model: function() {
    return Ember.RSVP.hash({
      book: this.store.createRecord('book'),
      genres: this.store.findAll('genre')
    });
  },
  setupController: function(controller, model) {
    controller.set('model', model.book);
    controller.set('genres', model.genres);
  },
  actions: {
    willTransition: function(transition) {
      if(this.currentModel.book.get('isNew')) {
        if(confirm("Are you sure you want to abandon progress?")) {
          this.currentModel.book.destroyRecord();
        } else {
          transition.abort();
        }
      }
    }
  }
});
App.ReviewsNewController = Ember.Controller.extend({
  ratings: [5,4,3,2,1],
  actions: {
    createReview: function() {
      var controller = this;
      this.get('model').save().then(function() {
        controller.transitionToRoute('index');
      });
    }
  }
});

App.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api',
  headers: {
    'Authorization': 'Token token=EMBER-TOKEN'
  }
});


App.BookDetailsComponent = Ember.Component.extend({
  classNameBindings: ['ratingClass'],
  ratingClass: function() {
    return "rating-" + this.get('book.rating');
  }.property('book.rating')
});

App.Genre = DS.Model.extend({
  name: DS.attr(),
  books: DS.hasMany('book', { async: true })
});

App.Book = DS.Model.extend({
  title: DS.attr(),
  author: DS.attr(),
  review: DS.attr(),
  rating: DS.attr('number'),
  amazon_id: DS.attr(),
  genre: DS.belongsTo('genre', { async: true }),

  url: function() {
    return "http://www.amazon.com/gp/product/"+this.get('amazon_id')+"/adamfortuna-20";
  }.property('amazon_id'),
  image: function() {
    return "http://images.amazon.com/images/P/"+this.get('amazon_id')+".01.ZTZZZZZZ.jpg";
  }.property('amazon_id')

});

