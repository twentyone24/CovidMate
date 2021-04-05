//
//  OverallStat.swift
//  CovidMate
//
//  Created by NAVEEN MADHAN on 4/5/21.
//

import Foundation
import SwiftUI

struct StatsView: View {
    @GraphQL(Covid.IAffected.cases)
    var cases

    @GraphQL(Covid.IAffected.deaths)
    var deaths

    @GraphQL(Covid.IAffected.recovered)
    var recovered

    var body: some View {
        HStack {
            VStack {
                Text(L10n.Headline.cases).font(.headline).fontWeight(.bold).foregroundColor(.primary)
                Text(cases.statFormatted).font(.callout).fontWeight(.medium).foregroundColor(.secondary)
            }

            Spacer()
            Divider().padding(.vertical, 8)
            Spacer()

            VStack {
                Text(L10n.Headline.deaths).font(.headline).fontWeight(.bold).foregroundColor(.primary)
                Text(deaths.statFormatted).font(.callout).fontWeight(.medium).foregroundColor(.secondary)
            }

            Spacer()
            Divider().padding(.vertical, 8)
            Spacer()

            VStack {
                Text(L10n.Headline.recovered).font(.headline).fontWeight(.bold).foregroundColor(.primary)
                Text(recovered.statFormatted).font(.callout).fontWeight(.medium).foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 16)
    }

}

extension Int {
    var statFormatted: String {
        return Double(self).statFormatted
    }
}

extension Double {
    var statFormatted: String {

        if self >= 1000, self <= 999999 {
            return String(format: "%.1fK", locale: Locale.current,self/1000).replacingOccurrences(of: ".0", with: "")
        }

        if self > 999999 {
            return String(format: "%.1fM", locale: Locale.current,self/1000000).replacingOccurrences(of: ".0", with: "")
        }

        return String(format: "%.0f", locale: Locale.current,self)
    }
}
