# (Swift) Core Data Concepts

## Objective
This is a repository to store the starter and final versions of the app for my Core Data tutorial on Medium.

## App Overview
This is a ToDo app which is built using Core Data. The final app has the following functionalities.

- Add ToDos
- Swipe to delete a ToDo
- Realtime update of UI using `NSFetchedResultsController`

## ToDo Entity attributes
- todoName: String
- todoDescription: String
- dateCreated: Date  
  Using this attribute for sorting.
- todoImage: Binary Data  
  `Allow External Storage` is set to be true.

---

The following are my notes for writing the actual contents of the article.

---

Core Data is a framework that you use to manage the model layer objects in your application. Using Core Data, you can save your application's permanent data for offline use and cache temporary data. 

## Entity
Entity is a basic Core Data class. It is very similar to the concept of the table in a relational database such as SQL, however, it encapsulates much more types of information.

## NSManagedObject
The NSManagedObject class is the base class which represents any Core Data entity/object. 

A managed object is associated with an entity description (NSEntityDescription) that provides metadata related to the object such as the name of the entity that the object represents and the names of its attributes and relationships. A managed object is also associated with a managed object context that tracks changes to the object graph.

It has the basic functionality of notifying you when the object has changed or is about to be deleted or saved. The managed object is consists of Core Data class and Core Data Properties.

### Core Data Class file
It holds your own custom code. This file is only generated if there is not a version present.

### Core Data Properties
Core Data properties are generated every time the Core Data classes are generated.

## NSManagedObjectContext
To save NSManagedObject instance or its subclass, you need to have NSManagedObjectContext. It is an object space that you use to manipulate and track changes to managed objects such as adding, updating and removing. Changes to managed objects are held in memory, in the associated context, until that context is saved to one or more persistent stores. Since all your data operations have to go through the managed oject context. Therefore, all NSManagedObjects have to have an associated context.

## NSPersistentContainer
You can think of the persistent container as the representation of your **core data stack** in your app. It represents your data store. You have to ask the persistent container for a managed object context which you use to save your managed objects.

## Attribute Types
We can use primitive types for attributes. Every attribute starts off as undefined. Undefined attributes must be marked as transient which is simply a NSObject. In addition to primitive types, there are two kinds of types.

### Binary Data
As you add larger data sets such as image data to Core Data, it will slow down the access time. Using the Binary Data type, you can select an option that allows us to use external storage. When we check this option, Core Data saves a reference to data. Data itself is saved outside of the app.

### Tansformable
Transformable is a type that converts to an NSObject and then is saved as a NSData. You have to perform a cast operation to access the object.

## NSFetchedResultsController
NSFetchedResultsController is a controller that you use to manage the results of a Core Data fetch request and to display data to the user. Using the controller, you can do the following things.

- Fetch necessary data instead of fetching all data at once
- Notified of changes  
  It can be notified when the data for the associated managed object context has been changed.
- Cache the data (Optional)  
  It can cache the data so that the app can display the contents without fetching again.
- Order the data by sections  
  This feature allows us to display the data separated by the given attribute.

## NSFetchedResultsControllerDelegate
- Notified of changes.
- inserted
- deleted
- moved
- updated

## Relationships
Relationships allow you to connect objects to other objects in a structured manner. There are two kinds of relationships: one to one and one to many.