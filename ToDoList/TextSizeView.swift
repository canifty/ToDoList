////
////  TextSizeView.swift
////  ToDoList
////
////  Created by Can Dindar on 2024-08-20.
////
//
//import SwiftUI
//
//struct TextSize: ViewModifier {
//    @Binding var size: CGSize
//    func body(content: Content) -> some View {
//        content.background(
//            GeometryReader { geometry in
//                Color.clear
//                    .preference(key: SizePreferenceKey.self, value:
//                                    geometry.size)
//                }
//                )
//                    .onPreferenceChange(SizePreferenceKey.self) { preferences in
//                        self.size = preferences
//                    }
//                    }
//                        struct  SizePreferenceKey: PreferenceKey {
//                        static var defaultValue: CGSize = .zero
//                        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
//                    }
//            }
