//
//  SearchView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/03.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var name = ""
 
    var body: some View {
        VStack {
            TextField("チャンピオン名", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())  // 入力域のまわりを枠で囲む
                .padding()  // 余白を追加
            Text("こんにちは、\(name)さん")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
