//
//  ContentView.swift
//  Calculator
//
//  Created by Ajmal Poovanath on 27/09/24.
//

import SwiftUI

enum CalcButton: String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "x"
    case equals = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor: Color{
        switch self {
        case .add, .substract, .multiply, .divide, .equals:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

struct ContentView: View {
    
    @State var value = "0"
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equals],
    ]
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                
                //Display
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundStyle(.white)
                }
                .padding()
                
                //Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self) { item in
                            Button {
                                
                            } label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(item: item),
                                           height: self.buttonHeight())
                                    .background(item.buttonColor)
                                    .foregroundStyle(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            }

                        }
                    }
                    .padding(.bottom, 3)
                }
            }
            
        }
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (5*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

#Preview {
    ContentView()
}
