//
//  ReviewDay.swift
//  Wordbank
//
//  Created by Mahipal Singh on 19/10/26.
//

import SwiftUI
import Charts

private struct ReviewDay: Identifiable {
    let id: String
    let label: String
    let count: Int
    let isToday: Bool
}

struct ReviewsPerDayChart: View {

    private let purple = Color.brandPrimary

    // Sample values to reproduce your screenshot.
    private let days: [ReviewDay] = [
        .init(id: "mon", label: "M", count: 3, isToday: false),
        .init(id: "tue", label: "T", count: 5, isToday: false),
        .init(id: "wed", label: "W", count: 2, isToday: false),
        .init(id: "thu", label: "T", count: 7, isToday: false),
        .init(id: "fri", label: "F", count: 4, isToday: false),
        .init(id: "sat", label: "S", count: 0, isToday: false),
        .init(id: "sun", label: "S", count: 0, isToday: true)
    ]

    private var maximumCount: Double {
        max(Double(days.map(\.count).max() ?? 1), 1) * 1.12
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("REVIEWS PER DAY")
                .font(.system(size: 10, weight: .medium))
                .tracking(1.2)
                .foregroundStyle(.secondary)

            Chart(days) { day in
                BarMark(
                    x: .value("Day", day.id),
                    y: .value(
                        "Reviews",
                        max(Double(day.count), 0.18)
                    ),
                    width: .fixed(30)
                )
                .foregroundStyle(days.isEmpty ? Color.gray.opacity(0.18): purple)
                .cornerRadius(3, style: .continuous)
            }
            .chartYScale(domain: 0...maximumCount)
            .chartYAxis(.hidden)
            .chartLegend(.hidden)
            .chartXAxis {
                AxisMarks(values: days.map(\.id)) { value in
                    AxisValueLabel {
                        if let id = value.as(String.self),
                           let day = days.first(where: { $0.id == id }) {

                            Text(day.label)
                                .font(.system(size: 10))
                                .foregroundStyle(
                                    day.isToday
                                        ? Color.primary
                                        : Color.secondary
                                )
                        }
                    }
                }
            }
            .frame(height: 135)
        }
    }
}

#Preview {
    ReviewsPerDayChart()
        .padding()
}
