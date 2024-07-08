//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Mohammad Azam on 8/20/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        
        NavigationView {
        
        OrderListView(orders: self.orderListVM.orders)
            
            .navigationBarTitle("Coffee Orders")
            .navigationBarItems(leading: Button(action: reloadOrders, label: {
                Image(systemName: "arrow.clockwise").foregroundColor(Color.white)
            }), trailing: Button(action: showAddCoffeeOrderView, label: {
                Image(systemName:"plus").foregroundColor(Color.white)
            }))
            .sheet(isPresented: self.$showModal, content: {
                AddCoffeeOrderView(isPresent: self.$showModal)
            })
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
