- Design for 20x capacity.
- Implement for 3x capacity.
- Deploy for ~1.5x capacity.

- Horizontal Duplication and Cloning (X-Axis ).
  - Clone Things
- Functional Decomposition and Segmentation - Microservices (Y-Axis). e.g. auth service, user profile service, photo service, etc
  - The Y axis is a service split - decomposing a monolithic code base into smaller services than can run independently
  - scale your technology team
  - Split Different Things
- Horizontal Data Partitioning - Shards (Z-Axis)
  - segmentation of “similar” things
  - Split Similar Things


- Don’t Check Your Work
  - Never read what you just wrote for the purpose of validation. Store data in a local or distributed cache if it is required for operations in the near future.






