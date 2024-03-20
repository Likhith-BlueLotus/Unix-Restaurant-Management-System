#!/bin/bash

# Function to get valid quantity
get_quantity() {
    while true; do
        quantity=$(zenity --entry --title="$1" --text="Enter the quantity for $2:")
        if [[ $? -ne 0 ]]; then
            echo "Cancelled or closed dialog. Exiting."
            exit 1
        elif [[ ! $quantity =~ ^[0-9]+$ ]]; then
            zenity --error --title="Error" --text="Please enter a valid quantity."
        else
            break
        fi
    done
}

# Welcome message
zenity --info --title="Welcome to our Restaurant" --text="Welcome, Click OK to Continue" --width=400 --height=200

# Menu selection
choice=$(zenity --list --title="MENU OPTIONS" --text="Choose your option:" --column="Options" "BREAKFAST" "LUNCH" "DINNER")

# Process user choice
case $choice in
    "BREAKFAST")
        # Breakfast menu options
        breakfast_choice=$(zenity --list --title="Breakfast Menu" --text="Choose your breakfast item:" --column="Options" "IDLI" "BISIBELE BATH" "PULIOGARE" "DOSA" "RAVA DOSA")
        
        # Get quantity for breakfast
        get_quantity "Breakfast" "$breakfast_choice"

        # Calculate total bill without discount
        case $breakfast_choice in
            "IDLI") total=$((quantity * 30)) ;;
            "BISIBELE BATH") total=$((quantity * 70)) ;;
            "PULIOGARE") total=$((quantity * 90)) ;;
            "DOSA") total=$((quantity * 70)) ;;
            "RAVA DOSA") total=$((quantity * 90)) ;;
        esac

        # Confirmation without discount information
        zenity --question --title="Confirmation" --text="Your total bill is $total. Confirm your order?" && \
        zenity --info --title="Order Confirmed" --text="Your order is confirmed. \nTotal bill: $total" || \
        zenity --info --title="Reorder" --text="Please reorder."
        ;;
    "LUNCH")
        # Lunch menu options
        lunch_choice=$(zenity --list --title="Lunch Menu" --text="Choose your lunch item:" --column="Options" "RICE" "DAL" "ROTI AND VEG CURRY" "PULAO" "PARATHA")
        
        # Get quantity for lunch
        get_quantity "Lunch" "$lunch_choice"

        # Calculate total bill without discount
        case $lunch_choice in
            "RICE") total=$((quantity * 90)) ;;
            "DAL") total=$((quantity * 140)) ;;
            "ROTI AND VEG CURRY") total=$((quantity * 160)) ;;
            "PULAO") total=$((quantity * 50)) ;;
            "PARATHA") total=$((quantity * 35)) ;;
        esac

        # Confirmation without discount information
        zenity --question --title="Confirmation" --text="Your total bill is $total. Confirm your order?" && \
        zenity --info --title="Order Confirmed" --text="Your order is confirmed. \nTotal bill: $total" || \
        zenity --info --title="Reorder" --text="Please reorder."
        ;;
    "DINNER")
        # Dinner menu options
        dinner_choice=$(zenity --list --title="Dinner Menu" --text="Choose your dinner item:" --column="Options" "RICE" "SANDWICH" "ROTI WITH PANEER CURRY" "KIMCHI PANCAKE" "SOFT DRINKS")
        
        # Get quantity for dinner
        get_quantity "Dinner" "$dinner_choice"

        # Calculate total bill without discount
        case $dinner_choice in
            "RICE") total=$((quantity * 150)) ;;
            "SANDWICH") total=$((quantity * 120)) ;;
            "ROTI WITH PANEER CURRY") total=$((quantity * 200)) ;;
            "KIMCHI PANCAKE") total=$((quantity * 220)) ;;
            "SOFT DRINKS") total=$((quantity * 320)) ;;
        esac

        # Confirmation without discount information
        zenity --question --title="Confirmation" --text="Your total bill is $total. Confirm your order?" && \
        zenity --info --title="Order Confirmed" --text="Your order is confirmed. \nTotal bill: $total" || \
        zenity --info --title="Reorder" --text="Please reorder."
        ;;
    *) zenity --info --title="Invalid Option" --text="Invalid option selected." ;;
esac

