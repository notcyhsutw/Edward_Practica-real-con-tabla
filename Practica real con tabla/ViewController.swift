//
//  ViewController.swift
//  Practica real con tabla
//
//  Created by Edward Pizzurro Fortun on 9/5/16.
//  Copyright © 2016 Edwjon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {


    @IBOutlet var textfield: UITextField!

    @IBOutlet var tableView: UITableView!

    @IBOutlet var swiche: UISwitch!


    //MutableArray which has the messages
    var messages:NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableView.delegate = self
        tableView.dataSource = self

        tableView.separatorStyle = UITableViewCellSeparatorStyle.None

    }



    @IBAction func swicheaction(sender: AnyObject)
    {

    }



    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // use large numbers to avoid collisions with system-defined views
        let messageViewTag = 2
        let ballonViewTag = 4
        let labelTag = 8

        var ballonview = UIImageView()
        var label = UILabel()

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)


        cell.selectionStyle = UITableViewCellSelectionStyle.None

        if let messageView = cell.contentView.viewWithTag(messageViewTag) {
            // message view is set
            ballonview = (messageView.viewWithTag(ballonViewTag) as! UIImageView)
            label = (messageView.viewWithTag(labelTag) as! UILabel)
        } else {
            // message view is NOT set
            ballonview.frame = CGRectZero
            ballonview.tag = ballonViewTag

            label.frame = CGRectZero
            label.backgroundColor = UIColor.clearColor()
            label.lineBreakMode = NSLineBreakMode.ByWordWrapping
            label.textAlignment = NSTextAlignment.Left
            label.numberOfLines = 0
            label.tag = labelTag
            label.sizeToFit()
            label.font = label.font.fontWithSize(14.0)

            let message = UIView()
            message.tag = messageViewTag
            message.frame = CGRectMake(0.0, 0.0, cell.frame.size.width, cell.frame.size.height)
            message.addSubview(ballonview)
            message.addSubview(label)

            cell.contentView.addSubview(message)
        }

        let textt: String = messages.objectAtIndex(indexPath.row) as! String


        let size:CGSize = textt.boundingRectWithSize(CGSizeMake(240.0, 480.0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14.0)], context: nil).size




        var ballon:UIImage = UIImage()


        if (swiche.on == true ) {


            ballonview.frame = CGRectMake(320.0 - (size.width + 28.0), 2.0, size.width + 28.0, CGFloat(ceil(Float(size.height))) + 15.0)
            ballon = UIImage(named: "green")!.stretchableImageWithLeftCapWidth(24, topCapHeight: 15)
            label.frame = CGRectMake(307.0 - (size.width + 5.0), 8.0, size.width + 5.0, CGFloat(ceil(Float(size.height))))


        } else {


            ballonview.frame = CGRectMake(0.0, 2.0, size.width + 28, size.height + 15)
            ballon = UIImage(named: "grey")!.stretchableImageWithLeftCapWidth(24, topCapHeight: 15)
            label.frame = CGRectMake(16, 8, size.width + 5, size.height)
        }


        ballonview.image = ballon
        label.text = textt as String



        return cell
    }




    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {

        let body:String = messages.objectAtIndex(indexPath.row) as! String
        let bodysize:CGSize = body.boundingRectWithSize(CGSizeMake(240.0, 480.0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14.0)], context: nil).size
        return bodysize.height + 15

    }


    @IBAction func Okqlq(sender: AnyObject)
    {
        if textfield.text != "" {
            messages.addObject(textfield.text!)
            tableView.reloadData()
            textfield.text = ""
            
        }
        
    }
    
    
    
    
}

