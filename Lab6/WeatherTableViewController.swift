//
//  WeatherTableViewController.swift
//  Lab6
//
//  Created by Local Account 436-01 on 10/18/17.
//  Copyright © 2017 Local Account 436-01. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    let apiString10DayForecast = "https://api.wunderground.com/api/0ed26ba3a84094e3/forecast10day/q/CA/San_Luis_Obispo.json"
    
    var txtForecast : TxtForecast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let request = URLRequest(url: URL(string: apiString10DayForecast)!)
        
        let task: URLSessionDataTask = session.dataTask(with: request)
        { (recievedData, response, error) -> Void in
            if let data = recievedData {
                do {
                    let decoder = JSONDecoder()
                    let txtForecastService = try decoder.decode(TxtForecastService.self, from: data)
                    
                    self.txtForecast = txtForecastService.forecast.txt_forecast
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                catch {
                    print("Exception on Decode: \(error)")
                }
            }
        }
        task.resume()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (txtForecast?.forecastDays.count) ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastDayCell", for: indexPath)
        
        let forecastDay = txtForecast!.forecastDays[indexPath.row]

        // Configure the cell...
        cell.textLabel?.text = "\(String(describing: forecastDay.period))   \(forecastDay.title)"
        cell.detailTextLabel?.text = "\(forecastDay.forecastText)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
