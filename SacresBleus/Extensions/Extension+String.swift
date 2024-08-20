//
//  Extension+String.swift
//  FranQ
//
//  Created by Eric Chandonnet on 2024-03-03.
//

import Foundation

extension String {
    func containsIgnoringCase(find: String) -> Bool {
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}
