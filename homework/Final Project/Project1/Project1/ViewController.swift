//
//  ViewController.swift
//  Project1
//
//  Created by Cayson Wilkins on 10/27/20.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var insertName: UITextField!
    @IBOutlet weak var usernameText: UILabel!
    
    static var user:User = User()
    
    let imagePickerController = UIImagePickerController()

    let locationManager = CLLocationManager()
    
    class CurrentLocation: NSObject, MKAnnotation {
      let title: String?
      let locationName: String?
      let discipline: String?
      let coordinate: CLLocationCoordinate2D

      init(
        title: String?,
        locationName: String?,
        discipline: String?,
        coordinate: CLLocationCoordinate2D
      ) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate

        super.init()
      }

      var subtitle: String? {
        return locationName
      }
    }
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        ViewController.user = UserController.getCurrentUser()
        if (!ViewController.user.username!.isEmpty) {
            usernameText.text = "Username: " + ViewController.user.username!
        }
        
        imageView!.layer.borderWidth = 1
        imageView!.layer.borderColor = UIColor.lightGray.cgColor
        
            let initialLocation = CLLocation(latitude: 10.283921, longitude: -157.831661)
        
            let coordinateRegion = MKCoordinateRegion(
                center: initialLocation.coordinate,
              latitudinalMeters: 1000,
              longitudinalMeters: 1000)
            mapView.setRegion(coordinateRegion, animated: true)
        
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true

            locationManager.delegate = self

            locationManager.startUpdatingLocation()

            locationManager.requestWhenInUseAuthorization()

            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters //kCLLocationAccuracyHundredMeters
        
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let currentLocation = locations.first{
                print(currentLocation.coordinate)
                let mapRegion = MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
                let currLocation = CurrentLocation(
                    title: "Your Current Location",
                    locationName: "Location Name",
                    discipline: "Human (YOU)",
                    coordinate: currentLocation.coordinate)
                mapView.addAnnotation(currLocation)

                mapView.setRegion(mapRegion, animated: true)
            }
        }

    @IBAction func changeOnClick(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose a profile photo", message: "Choose from your library or camera to select a profile photo to use in your new account.", preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (alertAction) in
            print("library")
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))

        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alertAction) in
            print("camera")
            if( UIImagePickerController.isSourceTypeAvailable(.camera) ){
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true, completion: nil)
            }
        }))

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
            print("cancel")
        }))

        present(alertController, animated: true, completion: nil)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        let alertController = UIAlertController(title: "Choose a profile photo", message: "Choose from your library or camera to select a profile photo to use in your new account.", preferredStyle: .actionSheet)
//
//        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (alertAction) in
//            print("library")
//            self.imagePickerController.sourceType = .photoLibrary
//            self.present(self.imagePickerController, animated: true, completion: nil)
//        }))
//
//        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alertAction) in
//            print("camera")
//            if( UIImagePickerController.isSourceTypeAvailable(.camera) ){
//                self.imagePickerController.sourceType = .camera
//                self.present(self.imagePickerController, animated: true, completion: nil)
//            }
//        }))
//
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
//            print("cancel")
//        }))
//
//        present(alertController, animated: true, completion: nil)
//        }


        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let choosenImage = info[.editedImage] as! UIImage

            imageView.image = choosenImage

            dismiss(animated: true, completion: nil)
        }

} 

