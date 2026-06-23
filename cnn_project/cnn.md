CNN Hardware Accelerator Using SystemVerilog

Abstract

This project presents a hardware implementation of a Convolutional Neural Network (CNN) accelerator developed using SystemVerilog. The design performs image classification through a complete neural inference pipeline consisting of convolution, activation, pooling, flattening, and fully connected layers.
The architecture is modular and supports structured data flow, starting from image memory and progressing through multiple processing stages. A key feature of the design is runtime weight loading, enabling flexible configuration of trained parameters without modifying the RTL. The system processes MNIST-style digit images and generates classification outputs corresponding to digit classes.

Project Goal

The primary goal of this project is to design and implement a CNN inference accelerator in hardware that can efficiently execute deep learning operations using SystemVerilog. The focus is on building a scalable pipeline architecture, supporting configurable parameters, and enabling real-time loading of trained weights.

Project Architecture

The CNN accelerator follows a staged processing pipeline:
Image Storage → Pixel Streaming → Convolution → ReLU → Max Pooling → ReLU → Max Pooling → Flatten → Fully Connected Layers → Output Classification
Each stage is implemented as an independent hardware module and coordinated through a central control mechanism.

Image Memory Unit : Stores input image data and provides access to the processing pipeline.
Pixel Streaming Module : Reads image data sequentially and converts it into a streaming format suitable for CNN processing.
Convolution Engine : Performs feature extraction using kernel-based multiply-accumulate operations.
Convolution Block : Acts as a control wrapper around convolution computation and memory access.
Kernel Storage : Holds trained weights and bias values used by convolution layers.
Runtime Parameter Loader : Enables dynamic loading of trained CNN weights into hardware memory during simulation or execution.
Activation Layer (ReLU) : Applies non-linearity by filtering negative values and preserving positive activations.
Pooling Unit : Reduces spatial dimensions of feature maps while preserving dominant features using max selection.
Flatten Module : Transforms 2D feature maps into a 1D vector representation for dense layers.
Fully Connected Layer : Performs classification using weighted sum operations and produces final output scores.
Control and Status Unit : Manages pipeline execution stages and ensures correct sequencing of operations across the CNN flow.

Design Architecture

The system is organized into a layered hardware structure and each layer communicates through synchronized valid-ready signaling.
Input Interface Layer (Image + Streaming)
Feature Extraction Layer (Convolution + Activation + Pooling)
Data Transformation Layer (Flattening)
Decision Layer (Fully Connected Network)
Control Layer (FSM-based status management)

Verification Environment

A SystemVerilog testbench is used to verify the CNN accelerator. The testbench compares DUT output against expected labels to determine correctness.
Stimulus generator for MNIST images
Driver for input transaction handling
Monitor for output observation
Scoreboard for result validation
Agent-based structure for modular verification

Data Flow Description

Input image is stored in memory
Pixel stream generator converts image into sequential data
Convolution extracts feature maps
ReLU introduces non-linearity
Pooling reduces feature size
Flatten prepares data for dense computation
Fully connected layers compute classification scores
Final predicted digit is produced

Implementation Features

Fully modular CNN pipeline
Support for runtime weight loading
FSM-controlled processing stages
Scalable convolution and fully connected layers
SystemVerilog-based verification environment
MNIST dataset-based simulation testing

Result Summary

The CNN accelerator successfully performs digit classification in simulation. The design demonstrates correct functionality across all pipeline stages and achieves accurate inference results for MNIST test samples.

Conclusion

This project demonstrates a complete hardware-based CNN inference system implemented in SystemVerilog. The design integrates all major deep learning operations into a structured hardware pipeline and validates functionality using a robust verification environment. The system is suitable for FPGA-based deployment and can be extended for larger neural network architectures.
