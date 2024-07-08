//
//  OrderTotalView.swift
//  CoffeeOrderingApp
//
//  Created by admin on 08/07/2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    
    var body: some View {
        HStack(alignment: .center, content: {
            Spacer()
            Text(String(format: "$%.2f", self.total)).font(.title)
                .foregroundColor(Color.green)
            Spacer()
        }).padding(10)
    }
}

#Preview {
    OrderTotalView(total: 45.67)
}
