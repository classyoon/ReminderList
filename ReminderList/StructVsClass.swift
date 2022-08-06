//
//  StructVsClass.swift
//  ReminderList
//
//  Created by Conner Yoon on 8/6/22.
//

import SwiftUI

struct Model {
var count = 0
    
    func add(){
//        count += 1
    }
}
class ModelVM : ObservableObject {
    @Published var model = Model()
}

struct StructVsClass: View {
    @State var model = Model()
    @StateObject var vm = ModelVM()
    
    var body: some View {
        VStack{
            NewView(model: $model)
            Text("\(model.count)")
            Button("Second Add"){
                model.count+=1
            }
            Divider()
            ExtractedView(vm: vm)
        }
    }
}
struct AnotherView : View {
    @ObservedObject var vm : ModelVM
    var body: some View {
        VStack{
            Text("\(vm.model.count)")
            Button {
                vm.model.count += 1
            } label: {
                Text("Increase")
            }

        }
        
    }
}
struct NewView : View {
    @Binding var model :  Model
    var body: some View{
        VStack{
            Text("\(model.count)")
            Button("Increase"){
                model.count+=1
            }
        }
    }
}

struct StructVsClass_Previews: PreviewProvider {
    static var previews: some View {
        StructVsClass()
    }
}

struct ExtractedView: View {
    @ObservedObject var vm : ModelVM
    var body: some View {
        VStack{
            Text("View Model \(vm.model.count)")
            Button {
                vm.model.count += 1
            } label: {
                Text("Increase")
            }
            AnotherView(vm: vm)
            
        }
    }
}
