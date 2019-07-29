new Vue({
  el: '#appbabel',
  data: {
    colors: {
      red: {color: 'Red', price: 1},
      blue: {color: 'Blue', price: 1},
      green: {color: 'Green', price: 1},
      purple: {color: 'Purple', price: 2.5}
    },
    sizes: {
      xsmall: {size: 'X-Small', price: 5},
      small: {size: 'Small', price: 10},
      Medium: {size: 'Medium', price: 10},
      large: {size: 'Large', price: 12},
      xlarge: {size: 'X-Large', price: 15},
      xxlarge: {size: 'XX-Large', price: 18}
    },
    styles: {
      crew_neck: {style: 'Crew Neck', price: 5},
      v_neck: {style: 'V Neck', price: 5}
    },
    user_selected_options: {
      color: '',
      size: '',
      style: '',
      quantity: 0
    },
    total: 0
  },
  methods: {
    retotal: function() {
      let newTotal = 0;
      if(this.user_selected_options.color) {
        newTotal = newTotal + this.colors[this.user_selected_options.color].price;
      }
      if(this.user_selected_options.size != '') {
        newTotal = newTotal + this.sizes[this.user_selected_options.size].price;
      }
      if(this.user_selected_options.style != '') {
        newTotal = newTotal + this.styles[this.user_selected_options.style].price;
      }
      this.total = newTotal;
    }
  }
});