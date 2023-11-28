//
//  ContentView29.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 28.11.2023.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> some MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        
        let annotation = MKPointAnnotation()
        annotation.title = "City"
        annotation.subtitle = "Town"
        annotation.coordinate = CLLocationCoordinate2DMake(56.84, 60.64)
        mapView.addAnnotation(annotation)
        mapView.isZoomEnabled = true
        
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
    }
}

struct ContentView29: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Hello, World!")
            MapView()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentView29()
}
