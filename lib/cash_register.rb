class CashRegister
    attr_accessor :discount, :total
    attr_reader :items

    def initialize(discount = 0)
        @total = 0
        self.discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @previous_total = self.total
        self.total += price * quantity
        while quantity > 0
            @items << title
            quantity -= 1
        end
    end

    def apply_discount
        self.total = total - (total * discount / 100)
        discount > 0 ? "After the discount, the total comes to $#{@total}." : "There is no discount to apply."
    end

    def void_last_transaction
        self.total = @previous_total
        self.total = 0 if @items.empty?
    end

end