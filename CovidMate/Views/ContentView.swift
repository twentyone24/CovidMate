//
//  ContentView.swift
//  CovidMate
//
//  Created by NAVEEN MADHAN on 4/5/21.
//


import SwiftUI
import FancyScrollView
import SwiftUICharts

struct ContentView: View {
    let api: Covid
    
    @GraphQL(Covid.myCountry)
    var currentCountry: FeaturedCountryCell.Country?

    @GraphQL(Covid.myCountry.name)
    var currentCountryName

    @GraphQL(Covid.myCountry.news)
    var currentCountryNews: [NewsStoryCell.NewsStory]?

    @GraphQL(Covid.world)
    var world: CurrentStateCell.World

    @GraphQL(Covid.world.timeline.cases.graph._forEach(\.value))
    var cases

    @GraphQL(Covid.world.news)
    var news: [NewsStoryCell.NewsStory]

    @GraphQL(Covid.countries)
    var countries: Paging<BasicCountryCell.Country>

    @GraphQL(Covid.countries.edges._forEach(\.node)._compactMap()._withDefault([]))
    var pins: [CountryMapPin]
    
    var body: some View {
        TabView {

            Home(api: api, currentCountry: _currentCountry, currentCountryName: _currentCountryName, currentCountryNews: _currentCountryNews, world: _world, cases: _cases, news: _news, countries: _countries, pins: _pins)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            InfosAboutCovid()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("Infos")
                }
        }
    }
}
